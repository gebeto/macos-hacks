HACK_PATH=${1:-.}

source "${HACK_PATH}/config"

ROOT="${HACK_PATH}/"
APP_ROOT="${ROOT}/${APP_NAME}.app"

rm -rf "${APP_ROOT}"
mkdir "${APP_ROOT}"

cp "${HACK_PATH}/run.sh" "${APP_ROOT}/${APP_NAME}"
cp "${HACK_PATH}/libpatch.dylib" "${APP_ROOT}/libpatch.dylib"

cp "${ICON_PATH}" "${ROOT}/Icon.icns"
