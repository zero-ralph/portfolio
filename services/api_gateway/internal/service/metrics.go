package service

import "github.com/zero-ralph/portfolio/services/api_gateway/internal/repository"

type ISystemService interface {
	Metrics() (bool, error)
	Health() (bool, error)
}

type SystemService struct {
	ISystemRepository repository.ISystemRepository
}

func NewSystemService(
	isystemRepository repository.ISystemRepository,
) (service ISystemService) {
	service = &SystemService{
		ISystemRepository: isystemRepository,
	}

	return service
}

func (systemService *SystemService) Metrics() (bool, error) {
	isRepositoryOk, err := systemService.ISystemRepository.Metrics()
	if err != nil {
		return false, err
	}
	return isRepositoryOk, nil
}


func (systemService *SystemService) Health() (bool, error) {
	isRepositoryOk, err := systemService.ISystemRepository.Health()
	if err != nil {
		return false, err
	}
	return isRepositoryOk, nil
}