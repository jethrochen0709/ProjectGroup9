args = commandArgs(trailingOnly = TRUE)
df = read.delim(args[1], sep = "\t", stringsAsFactors = FALSE)

agg = aggregate(star_rating ~ product_category, data = df, FUN = mean)
agg = agg[order(-agg$star_rating), ]
write.table(agg, gsub("_cleaned.tsv", "_avg_ratings.tsv", args[1]), sep = "\t", row.names = FALSE, quote = FALSE)
