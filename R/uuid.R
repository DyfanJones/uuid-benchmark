# developed from c++ implementation:  https://github.com/rkg82/uuid-v4
uuid_v4_base_loop <- function(n = 1) {
  uuids <- character(n)
  for (i in seq_len(n)) {
    bytes <- as.integer(runif(16, min = 0, max = 256)) # Limits of the interval

    bytes[7] <- bitwOr(bitwAnd(bytes[7], 0x0f), 0x40) # version 4
    bytes[9] <- bitwOr(bitwAnd(bytes[9], 0x3f), 0x80) # variant 10

    uuids[i] <- sprintf(
      "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",
      bytes[1], bytes[2], bytes[3],
      bytes[4],bytes[5],bytes[6],
      bytes[7],bytes[8],bytes[9],
      bytes[10],bytes[11],bytes[12],
      bytes[13],bytes[14],bytes[15],
      bytes[16]
    )
  }
  return(uuids)
}

uuid_v4_base_vector <- function(n = 1) {
  max_len <- 16*n
  bytes <- as.integer(runif(max_len, min = 0, max = 256)) # Limits of the interval

  v4 <- seq.int(7, max_len, 16)
  variant10 <- seq.int(9, max_len, 16)
  bytes[v4] <- bitwOr(bitwAnd(bytes[v4], 0x0f), 0x40) # version 4
  bytes[variant10] <- bitwOr(bitwAnd(bytes[variant10], 0x3f), 0x80) # variant 10

  sprintf(
    "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",
    bytes[seq.int(1, max_len, 16)], bytes[seq.int(2, max_len, 16)], bytes[seq.int(3, max_len, 16)],
    bytes[seq.int(4, max_len, 16)],bytes[seq.int(5, max_len, 16)],bytes[seq.int(6, max_len, 16)],
    bytes[seq.int(7, max_len, 16)],bytes[seq.int(8, max_len, 16)],bytes[seq.int(9, max_len, 16)],
    bytes[seq.int(10, max_len, 16)],bytes[seq.int(11, max_len, 16)],bytes[seq.int(12, max_len, 16)],
    bytes[seq.int(13, max_len, 16)],bytes[seq.int(14, max_len, 16)],bytes[seq.int(15, max_len, 16)],
    bytes[seq.int(16, max_len, 16)]
  )
}

