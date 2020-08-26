dx_plot <- function(diagnostic) {
  plot(
    diagnostic,
    mean.lwd = 1,
    target.lwd = 1,
    sim.lines = T,
    sim.lwd = 0.2,
    sim.alpha = 05,
    qnts = F
  )
}

dx_plot_write <- function(diagnostic, file_path) {
  jpeg(file = file_path, width=16, height=12, units="in", res = 600)
  dx_plot(diagnostic)
  dev.off()
}
