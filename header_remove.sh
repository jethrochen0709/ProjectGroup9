head -n 1 *_avg_helpful.tsv | head -n 1 > all_avg_helpful.tsv
head -n 1 *_avg_ratings.tsv | head -n 1 > all_avg_ratings.tsv

for file in *_avg_helpful.tsv; do
    tail -n +2 "$file" >> all_avg_helpful.tsv
done

for file in *_avg_ratings.tsv; do
    tail -n +2 "$file" >> all_avg_ratings.tsv
done
