# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Reasons to adopt this approach: In early morning hours, when there are several thousand observations per minute, the likelihood that the boats will be overwhelmed with the ammount of observations being fed to it is smaller, because the many observations will be evenly spread accross each boat, reducing the load on them. Conversely, if we chose a single boat to store observations from early morning hours, this could lead to this boat being overwhelmed.

Reasons not to adopt: This makes the querying process more complex, for example if a researcher wanted to get a table with only early morning observations, he would need to query all three boats.

## Partitioning by Hour

Reasons to adopt: This would allow researcher to more easily access data for early morning hours, for example.

Reasons not to adopt: As I already stated before: if we chose a single boat to store observations from early morning hours, this could lead to this boat being overwhelmed.

## Partitioning by Hash Value

Reasons to adopt: This approach, while distributing observations to all boats even during early morning hours, allows for easy querying when a researcher needs to find a specific observation based on its timestamp.

Reason not to adopt: This may require some extra complexity and computation  implementing the hash function. Also, this approach would not allow to easily query on a single boat whole sets of observations on a specified range of time. It would still require multiple querying on all boats.
