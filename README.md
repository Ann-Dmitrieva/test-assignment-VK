# Task
There is a table (**table**) with the following column structure:

**userId** — user identifier;

**eventName** — the name of the event (the action performed by the user), which can take the following values:

- **launch** — the user opened the app;
- **register** — the user registered in the app;
- **pageVisit** — the user visited the app page, which can be downloaded, updated, or purchased;
- **download** — the user downloaded the app from the store;
- **buy** — the user purchased the app from the store;
- **update** — the user updated the app in the store.
- **time** — the time of the event (when the user performed the action in eventName);

**product** — the identifier of the app the user downloaded/purchased or whose page the user visited (if the event is not related to a product, such as accessing the store or registering, the value of product is null).

Write an SQL query that divides users into weekly cohorts based on their registration date and calculates the conversion to the first download within these cohorts.

The final result of the query is a table with three columns:

- **week** — the week (cohort);
- **users** — the number of users who registered in the store for the first time during this week;
- **CR** — conversion to the first download for these users (the share of users who downloaded the app from the store in the same week as their registration week, i.e., the cohort).
