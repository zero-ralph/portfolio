package repository

type ISystemRepository interface {
	Metrics() (bool, error)
	Health() (bool, error)
}

type SystemRepository struct{}

func NewSystemRepository() (repository ISystemRepository) {
	repository = &SystemRepository{}

	return repository
}

func (systemRepository *SystemRepository) Metrics() (bool, error) {
	return true, nil
}

func (systemRepository *SystemRepository) Health() (bool, error) {
	return true, nil
}
