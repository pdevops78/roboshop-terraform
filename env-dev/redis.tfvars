redis = {
  main = {
    cluster_id      = "redis"
    engine          = "Redis"
    engine_version  = "6.2"
    node_type       = "cache.t4g.micro"
    num_cache_nodes = 1
    family          = "redis6.x"
  }
}