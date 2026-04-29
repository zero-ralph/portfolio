package pkg

import (
	"errors"

	"github.com/joho/godotenv"
)

type Config struct {
	Database Database
}

type Database struct {
	User     string `env:"PLATFORM_POSTGRES_USER"`
	Password string `env:"PLATFORM_POSTGRES_PASSWORD"`
	DBName   string `env:"PLATFORM_POSTGRES_DBNAME"`
	Host     string `env:"PLATFORM_POSTGRES_HOST"`
	Port     string `env:"PLATFORM_POSTGRES_PORT"`
}

func LoadEnv() error {
	if err := godotenv.Load(); err != nil {
		return errors.New(err.Error())
	}
	return nil
}
