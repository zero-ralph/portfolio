package cmd

import (
	"log/slog"
	"os"

	"github.com/caarlos0/env/v11"
	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	"github.com/zero-ralph/portfolio/api/internal/middleware"
	"github.com/zero-ralph/portfolio/api/pkg"
	"gorm.io/gorm"
)

type Server struct {
	logger   *slog.Logger
	config   *pkg.Config
	database *gorm.DB
	metrics  *pkg.Metrics
}

func Run() {
	// Initialize Logger
	logger := slog.New(slog.NewJSONHandler(os.Stderr, nil))

	// Read .env file
	if err := pkg.LoadEnv(); err != nil {
		panic(err)
	}

	var config pkg.Config
	if err := env.Parse(&config); err != nil {
		panic(err)
	}

	// Initialize Database
	database, err := pkg.InitializeDatabase(config)
	if err != nil {
		panic(err)
	}

	// Initialize Prometheus
	prometheusRegistry := prometheus.NewRegistry()

	serverConfiguration := &Server{
		logger:   logger,
		config:   &config,
		database: database,
		metrics:  pkg.NewMetrics(prometheusRegistry),
	}

	router := gin.Default()
	router.Use(middleware.PrometheusMiddleware(serverConfiguration.metrics))

	router.GET("/metrics", gin.WrapH(promhttp.HandlerFor(prometheusRegistry, promhttp.HandlerOpts{})))

	router.GET("/ping", func(c *gin.Context) {
		serverConfiguration.logger.Error("Test if working")
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	if err := router.Run(":1233"); err != nil {
		panic(err)
	}
}
