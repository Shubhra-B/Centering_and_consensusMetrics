setwd(".")
files <- dir(".", pattern = ".txt")

# Read each file into a named list of data frames
df_list <- lapply(files, function(file) {
  read.table(file, header = TRUE, sep = "\t", stringsAsFactors = FALSE)
})

#clean the file to get only cleaned vst transformed reads
vst_transformed=df_list[[1]]
vst_transformed_mat <- vst_transformed %>%
  {rownames(.) <- NULL; .} %>%
  column_to_rownames("gene") %>%
  {as.matrix(.);} 


#calculate the MAD metric
compute_metric <- function(input) {
mad_values <- apply(input, 1, mad, na.rm = TRUE)
results <- list()
for (i in seq(1000, 5000, by = 1000)) {
top_indices <- order(mad_values, decreasing = TRUE)[1:i]
top_rows <- input[top_indices, , drop = FALSE]
# Median-center each row
centered <- sweep(top_rows, 1, apply(top_rows, 1, median, na.rm = TRUE))
results[[paste0("top_MAD_", i)]] <- centered}
return(results)} 

#access the MAD for appropriate n
mad_results <- compute_metric(vst_transformed_mat)
mad_results$top_MAD_5000
