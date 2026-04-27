package main

import (
	"github.com/labstack/echo/v5"
	"github.com/zero-ralph/portfolio/services/api_gateway/internal/handler"
	"github.com/zero-ralph/portfolio/services/api_gateway/internal/repository"
	"github.com/zero-ralph/portfolio/services/api_gateway/internal/service"
)

type Server struct {
	router         *echo.Group
	internalRouter *echo.Group
}

func run(engine *echo.Echo) error {

	router := engine.Group("/api")
	server := &Server{
		router: router,
	}

	server.ServiceRepositoryInitialize()
	return nil
}

func (server *Server) ServiceRepositoryInitialize() {
	server.internalRouter = server.router.Group("/internal")

	systemRepository := repository.NewSystemRepository()
	systemService := service.NewSystemService(systemRepository)

	server.HandlerInternalRouter(
		systemService,
	)
}

func (server *Server) HandlerInternalRouter(
	systemService service.ISystemService,
) {
	internalRouter := server.internalRouter.Group("/system")
	handler.NewSystemHandler(internalRouter, systemService)
}
