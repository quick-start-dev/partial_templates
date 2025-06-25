package middleware

import (
	"log"
	"time"

	"github.com/gin-gonic/gin"
)

func LoggingMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		startTime := time.Now()
		c.Next() // Process the request
		endTime := time.Now()
		latency := endTime.Sub(startTime)

		log.Printf("[GIN] %s %s %d %s",
			c.Request.Method,
			c.Request.RequestURI,
			c.Writer.Status(),
			latency,
		)
	}
}
