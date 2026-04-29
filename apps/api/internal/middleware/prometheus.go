package middleware

import (
	"fmt"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/zero-ralph/portfolio/api/pkg"
)

func PrometheusMiddleware(metrics *pkg.Metrics) gin.HandlerFunc {
	return func(c *gin.Context) {
		fmt.Println(c)
		start := time.Now()
		metrics.HttpRequestsInFlight.Inc()

		c.Next()

		metrics.HttpRequestsInFlight.Dec()

		duration := time.Since(start).Seconds()
		status := strconv.Itoa(c.Writer.Status())

		metrics.HttpRequestsTotal.WithLabelValues(
			c.Request.Method,
			c.FullPath(),
			status,
		).Inc()

		metrics.HttpRequestsDuration.WithLabelValues(
			c.Request.Method,
			c.FullPath(),
		).Observe(duration)
	}
}
