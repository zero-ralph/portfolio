package utils

import (
	"log/slog"
	"os"
)

type LogLevel string

const (
	ERROR_LOG   = "error"
	INFO_LOG    = "info"
	WARNING_LOG = "warning"
	DEBUG_LOG   = "debug"
)

var logger = slog.New(
	slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{
		Level: slog.LevelDebug,
	}),
)

func LogHandler(logType string, message string) {

	switch logType {
	case ERROR_LOG:
		logger.Error(message)
	case WARNING_LOG:
		logger.Warn(message)
	case INFO_LOG:
		logger.Info(message)
	}
}
