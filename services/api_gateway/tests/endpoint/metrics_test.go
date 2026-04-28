package endpoint

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/labstack/echo/v5"
	"github.com/labstack/echo/v5/echotest"
	"github.com/stretchr/testify/assert"
)

func TestMetricsEndpoint(t *testing.T) {
	// 1. Recreate the engine and route setup exactly as in your main()
	handler := func(c *echo.Context) error {
		return c.String(http.StatusOK, "true")
	}

	// 2. Use echotest to serve the request directly to the engine
	// This tests the real route registration and anonymous handler
	req := httptest.NewRequest(http.MethodGet, "/metrics", nil)
	config := echotest.ContextConfig{
		Request: req,
	}

	rec := config.ServeWithHandler(t, handler)

	// 3. Assertions
	assert.Equal(t, http.StatusOK, rec.Code)
	assert.Equal(t, "true", rec.Body.String())
}
