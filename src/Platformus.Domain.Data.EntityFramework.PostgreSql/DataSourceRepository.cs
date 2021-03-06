﻿// Copyright © 2015 Dmitry Sikorsky. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System.Collections.Generic;
using System.Linq;
using ExtCore.Data.EntityFramework.PostgreSql;
using Microsoft.EntityFrameworkCore;
using Platformus.Barebone.Data.Extensions;
using Platformus.Domain.Data.Abstractions;
using Platformus.Domain.Data.Models;

namespace Platformus.Domain.Data.EntityFramework.PostgreSql
{
  public class DataSourceRepository : RepositoryBase<DataSource>, IDataSourceRepository
  {
    public DataSource WithKey(int id)
    {
      return this.dbSet.FirstOrDefault(ds => ds.Id == id);
    }

    public IEnumerable<DataSource> FilteredByMicrocontrollerId(int microcontrollerId)
    {
      return this.dbSet.Where(ds => ds.MicrocontrollerId == microcontrollerId).OrderBy(ds => ds.CSharpClassName);
    }

    public IEnumerable<DataSource> FilteredByMicrocontrollerIdRange(int microcontrollerId, string orderBy, string direction, int skip, int take, string filter)
    {
      return this.GetFilteredDataSources(dbSet, microcontrollerId, filter).OrderBy(orderBy, direction).Skip(skip).Take(take);
    }

    public void Create(DataSource dataSource)
    {
      this.dbSet.Add(dataSource);
    }

    public void Edit(DataSource dataSource)
    {
      this.storageContext.Entry(dataSource).State = EntityState.Modified;
    }

    public void Delete(int id)
    {
      this.Delete(this.WithKey(id));
    }

    public void Delete(DataSource dataSource)
    {
      this.dbSet.Remove(dataSource);
    }

    public int CountByMicrocontrollerId(int microcontrollerId, string filter)
    {
      return this.GetFilteredDataSources(dbSet, microcontrollerId, filter).Count();
    }

    private IQueryable<DataSource> GetFilteredDataSources(IQueryable<DataSource> dataSources, int microcontrollerId, string filter)
    {
      dataSources = dataSources.Where(ds => ds.MicrocontrollerId == microcontrollerId);

      if (string.IsNullOrEmpty(filter))
        return dataSources;

      return dataSources.Where(ds => ds.CSharpClassName.ToLower().Contains(filter.ToLower()));
    }
  }
}
