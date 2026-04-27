package main

import (
	"net/http"

	"github.com/labstack/echo/v5"
)

func main() {
	engine := echo.New()

	engine.GET("/health", func(c *echo.Context) error {
		return c.String(http.StatusOK, "Hello, World!")
	})

	if err := engine.Start(":1233"); err != nil {
		engine.Logger.Error(err.Error())
	}
}
