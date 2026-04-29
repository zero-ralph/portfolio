package handlertest

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

func setUpRouter() *gin.Engine {
	router := gin.Default()

	router.GET("/health", func(c *gin.Context) {
		c.JSON(200, map[string]string{"details": "Ok"})
	})

	return router
}

func TestHealthCheck(t *testing.T) {
	router := setUpRouter()
	recorder := httptest.NewRecorder()
	request, _ := http.NewRequest("GET", "/health", nil)
	router.ServeHTTP(recorder, request)

	assert.Equal(t, 200, recorder.Code)
}
