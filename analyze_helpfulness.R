args = commandArgs(trailingOnly = TRUE)
df = read.delim(args[1], sep = "\t", stringsAsFactors = FALSE)

agg = aggregate(helpful_votes ~ product_category, data = df, FUN = mean)
agg = agg[order(-agg$helpful_votes), ]
write.table(agg, gsub("_cleaned.tsv", "_avg_helpful.tsv", args[1]), sep = "\t", row.names = FALSE, quote = FALSE)
