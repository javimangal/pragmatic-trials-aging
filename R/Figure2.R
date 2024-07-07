# This script is sourced into the main file Data_cleaning_and_conditions.qmd
# to produce figure 2

Conditions <- data %>% pull(Conditions)

# COVID-19
Conditions <- gsub('covid19', 'covid-19', Conditions, ignore.case = TRUE)
Conditions <- gsub('sars-cov-2', 'covid-19', Conditions, ignore.case = TRUE)
Conditions <- gsub('coronavirus', 'covid-19', Conditions, ignore.case = TRUE)
Conditions <- gsub('corona virus', 'covid-19', Conditions, ignore.case = TRUE)

# Infections 
Conditions <- gsub('infection', 'infections', Conditions, ignore.case = TRUE)
Conditions <- gsub('infectionss', 'infections', Conditions, ignore.case = TRUE)

# Depression 
Conditions <- gsub('depressive', 'depression', Conditions, ignore.case = TRUE)


docs <- Corpus(VectorSource(Conditions))

toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "\\|")
docs <- tm_map(docs, toSpace, ",")

docs <- tm_map(docs, removeWords, stopwords("english"))

dtm <- TermDocumentMatrix(docs) 
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)

table <- data.frame(word = names(v),freq=v) %>% 
  filter(
    ! word %in% c("disease","diseases","stage","disorder","disorders","type","with","use","ajcc","cell","end")
  )

wordcloud <- wordcloud2(table)

saveWidget(
  wordcloud,
  "tmp.html",
  selfcontained = TRUE
)

webshot(
  "tmp.html",
  paste0(figfolder,"/Figure_2.png"),
  delay = 5,
  vwidth = 720,
  vheight = 640
)

file.remove("tmp.html")
