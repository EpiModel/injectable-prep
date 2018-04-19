
## abc model analysis

library("EpiModelHIV")
library("EasyABC")

system("scp scripts/burnin/abc/*.abc.[Rs]* hyak:/suppscr/csde/sjenness/lap")

system("scp hyak:/suppscr/csde/sjenness/lap/data/lap.*.rda scripts/burnin/abc/")


## averaged ATL/demo fits
load("scripts/burnin/abc/lap.abc.rda")

p <- as.data.frame(a$param)
s <- as.data.frame(a$stats)
w <- a$weights

names(p) <- c("ai.scale", "rgc.tprob", "ugc.tprob", "rct.tprob", "uct.tprob",
              "gc.ntx.int", "ct.ntx.int", "hiv.r.rr", "hiv.u.rr")

names(s) <- c("gc.incid1", "gc.incid2", "gc.incid3", "gc.incid4", "gc.incid5",
              "ct.incid1", "ct.incid2", "ct.incid3", "ct.incid4", "ct.incid5",
              "hiv.prev1", "hiv.prev2")

mean.s <- apply(s, 2, function(x) sum(x * w))
mean.s

mean.p <- apply(p, 2, function(x) sum(x * w))
mean.p

round(mean.p, 4)

targets <- c(4.2, 4.2, 4.2, 4.2, 4.2,
            6.6, 6.6, 6.6, 6.6, 6.6,
            0.26, 0.26)

round(data.frame(mean.s, targets), 3)

round(mean.p, 3)

par(mar = c(3,3,1,1), mgp = c(2,1,0), mfrow = c(4,3))
for (i in 1:ncol(s)) {
  hist(s[, i], col = "steelblue2", border = "white",
       main = names(s)[i], xlab = "")
  abline(v = targets[i], lwd = 2, col = "red")
}


library("plotrix")
par(mar = c(3,3,1,1), mgp = c(2,1,0), mfrow = c(3,3))
for (i in 1:ncol(p)) {
  weighted.hist(p[, i], w, col = "steelblue2", border = "white",
       main = names(p)[i], xlab = "")
}
