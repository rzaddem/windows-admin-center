[string] $IMAGE_NAME = $Env:CI_REGISTRY_IMAGE + ':1.0'

Write-Host "Logging in to the registry" $Env:CI_REGISTRY "..."
docker login -u "$Env:CI_REGISTRY_USER" -p "$Env:CI_REGISTRY_PASSWORD" $Env:CI_REGISTRY

Write-Host "Building image ..."
docker build -t "$IMAGE_NAME" .

Write-Host "Logging in to the registry $Env:CI_REGISTRY again, as it can timeout on long build\push ..."
docker login -u "$Env:CI_REGISTRY_USER" -p "$Env:CI_REGISTRY_PASSWORD" $Env:CI_REGISTRY

Write-Host "Pushing new image to GitLab Container Registry ..."
docker push "$IMAGE_NAME"
