args = commandArgs(trailingOnly = TRUE)
df = read.delim(args[1], sep = "\t", stringsAsFactors = FALSE)

cor_val = cor(df$star_rating, df$helpful_votes, use = "complete.obs")
outfile = gsub("_cleaned.tsv", "_correlation.txt", args[1])
write(paste(basename(args[1]), round(cor_val, 4), sep = "\t"), file = outfile)
