package handler

import (
	"github.com/labstack/echo/v5"
	"github.com/zero-ralph/portfolio/services/api_gateway/internal/service"
	"github.com/zero-ralph/portfolio/services/api_gateway/utils"
)

type ISystemHandler interface {
	Metrics(c *echo.Context) error
	Health(c *echo.Context) error
}

type SystemHandler struct {
	systemService service.ISystemService
}

func NewSystemHandler(
	systemRouter *echo.Group,
	systemService service.ISystemService,
) ISystemHandler {
	handler := &SystemHandler{
		systemService: systemService,
	}

	systemRouter.GET("/metrics", handler.Metrics)
	return handler
}

func (systemHandler *SystemHandler) Metrics(c *echo.Context) error {
	isSystemServiceOk, err := systemHandler.systemService.Metrics()
	if err != nil {
		utils.LogHandler(utils.ERROR_LOG, "Failed to get metrics: "+err.Error())
		return c.JSON(500, map[string]string{"error": "Failed to get metrics"})
	}
	return c.JSON(200, isSystemServiceOk)
}

func (systemHandler *SystemHandler) Health(c *echo.Context) error {
	isSystemServiceOk, err := systemHandler.systemService.Health()
	if err != nil {
		utils.LogHandler(utils.ERROR_LOG, "Failed to get health: "+err.Error())
		return c.JSON(500, map[string]string{"error": "Failed to get health"})
	}
	return c.JSON(200, isSystemServiceOk)
}
