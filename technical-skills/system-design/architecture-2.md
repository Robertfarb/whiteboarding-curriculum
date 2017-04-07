leader-follower replication (master/slave)
DB tier with multiple machines
-all Rails machines talk to all DB machines. both read/write
-all writes go to leader machines
-reads go to all machines
-only the leader writes to follower machines to keep followers up to date
-leader ships logs, which are a record of changes
-follower state replicates leader state
-followers are like backups and increase durability
-followers don't see queries, just see the effects of the queries from the log

distributing write load
sharding
-creates complexity
-split up data across n machines
-data is typically partitioned by hash of primary key % n
-point queries distributed across shards
-ideal for transactions that only read/write a single row

joins are not scalable
-would need to look at every shard to do a join

denormalize database
-add redundancies into database
-denormalizing selectively results in higher performance
e.g., if you're looking for friend count, having a count column on a user plus the regular joins makes the count query fast
e.g., friends table with user_id and array of friends
-difficult to keep data up to date -- if user name changes, must change all their friend's rows in every shard
-worth extra effort if name doesn't change that often

benefits of normalization
-easier to maintain
-less space
