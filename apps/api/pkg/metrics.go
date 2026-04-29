package pkg

import "github.com/prometheus/client_golang/prometheus"

type Metrics struct {
	HttpRequestsTotal    *prometheus.CounterVec
	HttpRequestsDuration *prometheus.HistogramVec
	HttpRequestsInFlight prometheus.Gauge
}

func NewMetrics(prometheusRegistry *prometheus.Registry) (metrics *Metrics) {
	metrics = &Metrics{
		HttpRequestsTotal: prometheus.NewCounterVec(prometheus.CounterOpts{
			Namespace: "Portfolio",
			Subsystem: "http",
			Name:      "requests_total",
			Help:      "Total number of HTTP Requests",
		}, []string{"method", "path", "status"}),

		HttpRequestsDuration: prometheus.NewHistogramVec(prometheus.HistogramOpts{
			Namespace: "Portfolio",
			Subsystem: "http",
			Name:      "requests_duration_seconds",
			Help:      "Duration of the HTTP requests in seconds",
		}, []string{"method", "span"}),

		HttpRequestsInFlight: prometheus.NewGauge(prometheus.GaugeOpts{
			Namespace: "Portfolio",
			Subsystem: "http",
			Name:      "requests_in_flight",
			Help:      "Number of HTTP requests currently being processed",
		}),
	}

	prometheusRegistry.MustRegister(
		metrics.HttpRequestsTotal,
		metrics.HttpRequestsDuration,
		metrics.HttpRequestsInFlight,
	)
	return
}
