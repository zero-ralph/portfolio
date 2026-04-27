package main

import (
	"github.com/labstack/echo/v5"
	"github.com/zero-ralph/portfolio/services/api_gateway/utils"
)

func main() {
	engine := echo.New()

	if err := run(engine); err != nil {
		utils.LogHandler(utils.ERROR_LOG, "Failed to start API Gateway: "+err.Error())
	}

	if err := engine.Start(":1233"); err != nil {
		engine.Logger.Error(err.Error())
		utils.LogHandler(utils.INFO_LOG, "API Gateway started on port 1233")
	}

}
