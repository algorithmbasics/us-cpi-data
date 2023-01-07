## Import in R using the following code

```{r}
cpi_file_url <- "https://raw.githubusercontent.com/algorithmbasics/us-cpi-data/main/cpi.txt"

cpi_data <- read.table(cpi_file_url, header = TRUE, sep = "|")
```

### Some charts

![Figure 1](https://raw.githubusercontent.com/algorithmbasics/us-cpi-data/main/cpi-trend.png)

- Code that produces the above ggplot graph is shown below:
  - [https://raw.githubusercontent.com/algorithmbasics/us-cpi-data/main/cpi-trend-graph.R](https://raw.githubusercontent.com/algorithmbasics/us-cpi-data/main/cpi-trend-graph.R)






## Import in Python using the following code


```{python}
import pandas as pd

cpi_file_url = "https://raw.githubusercontent.com/algorithmbasics/us-cpi-data/main/cpi.txt"

cpi_data = pd.read_csv(cpi_file_url, sep="|")

cpi_ann = pd.DataFrame(cpi_data, columns= ['YEAR', 'CPI_ANN'])

cpi_ann
```





## Import in Stata using the following code

```{stata}
local cpi_file_url = "https://raw.githubusercontent.com/algorithmbasics/us-cpi-data/main/cpi.txt"

import delimited `cpi_file_url', delim("|", collapse) clear
```





## Import in SAS using the following code

```{sas}
filename cpi_data temp;

/* fetch data from github */

proc http
  url = "https://raw.githubusercontent.com/algorithmbasics/us-cpi-data/main/cpi.txt"
  method = "GET"
  out = cpi_data;
run;

/* import to a SAS data set */

proc import file = cpi_data
  out=work.cpi_data dbms = dlm replace;
  delimiter = "|";
  getnames = yes;
run;
```
