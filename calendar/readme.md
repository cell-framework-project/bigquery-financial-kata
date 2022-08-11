### CREATION OF A CALENDAR

#### First of all we need some date array, right?

```sql
GENERATE_DATE_ARRAY('1970-01-01', '2100-12-31')
```

##### So then we have something like this:

```python
['1970-01-01','1970-01-02','1970-01-03','1970-01-04','1970-01-05',...]
```

#### But now we need to have the date expresed as a single column... so: 

```sql
SELECT 
date 
FROM UNNEST(GENERATE_DATE_ARRAY('1970-01-01', '2100-12-31')) AS date ORDER BY date;
```

##### So now we have a table with a single date column:
<table>
  <thead>
    <tr>
      <th>date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1970-01-01</td>
      <td>1970-01-02</td>
      <td>1970-01-03</td>
      <td>...</td>
    </tr>
  </tbody>
<table>