library(ggplot2)

theme_plex <- function(base_size = 11,
                       strip_text_size = 12,
                       strip_text_margin = 5,
                       subtitle_size = 13,
                       subtitle_margin = 10,
                       plot_title_size = 16,
                       plot_title_margin = 10,
                       ...) 
{
  ret <- ggplot2::theme_minimal(base_family = "IBMPlexSans",
                                base_size = base_size, ...)
  ret$strip.text <- ggplot2::element_text(hjust = 0, size=strip_text_size,
                                          margin=margin(b=strip_text_margin),
                                          family="IBMPlexSans-Medium")
  ret$plot.subtitle <- ggplot2::element_text(hjust = 0, size=subtitle_size,
                                             margin=margin(b=subtitle_margin),
                                             family="IBMPlexSans")
  ret$plot.title <- ggplot2::element_text(hjust = 0, size = plot_title_size,
                                          margin=margin(b=plot_title_margin),
                                          family="IBMPlexSans-Bold")
  ret
}


my_color_pal <- scale_color_manual(
  values = c("midnightblue", "mediumvioletred",
             "palegreen4", "deepskyblue4")
)

my_fill_pal <- scale_fill_manual(
  values = c("midnightblue", "mediumvioletred",
             "palegreen4", "deepskyblue4")  
)


my_fill_pall2 <- scale_fill_manual(
  values = c(
    'slateblue4', 'steelblue4', 'turquoise4',
    'slateblue3', 'steelblue3', 'turquoise3',
    'slateblue2', 'steelblue2', 'turquoise2',
    'slateblue1', 'steelblue1', "turquoise1")
)

theme_set(theme_plex())
