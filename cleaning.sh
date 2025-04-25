#!/bin/bash

input="$1"
output="${input%.tsv}_cleaned.tsv"
awk -F'\t' '
BEGIN {
    OFS = "\t";
}
NR == 1 {
    for (i = 1; i <= NF; i++) {
        if ($i == "review_id") rid = i;
        else if ($i == "product_title") title = i;
        else if ($i == "product_category") category = i;
        else if ($i == "star_rating") rating = i;
        else if ($i == "helpful_votes") help = i;
        else if ($i == "total_votes") total = i;
    }
    print "review_id", "product_title", "product_category", "star_rating", "helpful_votes", "total_votes";
    next;
}
{
    if ($rid == "" || $title == "" || $category == "" || $rating == "" || $help == "" || $total == "") next;
    if ($rid == "NA" || $title == "NA" || $category == "" || $rating == "NA" || $help == "NA" || $total == "NA") next;
    print $rid, $title, $category, $rating, $help, $total;
}
' "$input" > "$output"
