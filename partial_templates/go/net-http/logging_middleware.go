package middleware

import (
	"log"
	"net/http"
	"time"
)

func LoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		startTime := time.Now()
		next.ServeHTTP(w, r) // Serve the request
		endTime := time.Now()
		latency := endTime.Sub(startTime)

		log.Printf("[HTTP] %s %s %s",
			r.Method,
			r.RequestURI,
			latency,
		)
	})
}
