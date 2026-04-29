package pkg

import (
	"fmt"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	log "gorm.io/gorm/logger"
)

func InitializeDatabase(config Config) (db *gorm.DB, err error) {
	dsn := fmt.Sprintf("host=%v user=%v password=%v dbname=%v port=%v sslmode=disable",
		config.Database.Host,
		config.Database.User,
		config.Database.Password,
		config.Database.DBName,
		config.Database.Port,
	)

	db, err = gorm.Open(postgres.Open(dsn), &gorm.Config{
		Logger: log.Default.LogMode(log.Silent),
	})

	return
}
