# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Adapting random partitioning is a good choice when priority is to distribute the date equally to all servers and it is easy to implement. This approach is not efficient when it comes to querying specific sets of data. However, it can be improved by making a separate log index database that contains the information on which server contains what data.

## Partitioning by Hour

This approach is preferable when AquaByte is sending data all the time, since we can utilize all the servers and it is effectively easy on querying specific sets of data. However, since AquaByte mostly sends data between midnight and 1am, this method of partitioning will not distribute data equally to all severs.

## Partitioning by Hash Value

This approach can be used when the data sets are limited and hash values can be generated between a limit; this way it will distribute data equally to all the servers, and querying would be a lot easier. However, since data are being stored based on the hash value of the timestamp, the hash value needs to be generated before storing it. Hashing needs extra calculations, which require dedicated memory and time. Researchers will have to get the hash value of a specific timestamp to look which sever contains that data.
