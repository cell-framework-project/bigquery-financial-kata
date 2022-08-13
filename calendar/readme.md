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
FROM UNNEST(GENERATE_DATE_ARRAY('1970-01-01', '2100-12-31')) AS date 
  ORDER BY date;
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
    </tr>
    <tr>
      <td>1970-01-02</td>
    </tr>
    <tr>
      <td>1970-01-03</td>
    </tr>
    <tr>
      <td>...</td>
    </tr>
  </tbody>
<table>

#### Then we can add a sourrogate id but with some logic, so let's create a timestamp expresed in days from 1970-01-01 in ordinals

```sql
ROW_NUMBER() OVER(ORDER BY date) AS timestamp_days
```

#### And lets take the year, month and date fields as integers <b>INT64</b> using EXTRACT :

```sql
EXTRACT(YEAR FROM date) AS year
```

```sql
EXTRACT(MONTH FROM date) AS as month
```

```sql
EXTRACT(DAY FROM date) AS as day
```

##### Now it looks like this:
<table>
  <thead>
    <tr>
      <th>1</th>
      <th>date</th>
      <th>year</th>
      <th>month</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>1970-01-01</td>
      <td>1970</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <td>2</td>
      <td>1970-01-02</td>
      <td>1970</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <td>3</td>
      <td>1970-01-03</td>
      <td>1970</td>
      <td>1</td>
      <td>3</td>
    </tr>
    <tr>
      <td>...</td>
    </tr>
  </tbody>
<table>

