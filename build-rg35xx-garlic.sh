make clean
make
if [ -d "build-rg35xx-garlic" ]; then
    rm -rf build-rg35xx-garlic
fi
mkdir build-rg35xx-garlic
cd build-structure/rg35xx-garlic
cp -rf ROMS ../../build-rg35xx-garlic
cd ../../
cp -f OpenJazz "build-rg35xx-garlic/ROMS/PORTS/Jazz Jackrabbit"
cp -f openjazz.000 "build-rg35xx-garlic/ROMS/PORTS/Jazz Jackrabbit/game"
cd build-rg35xx-garlic
zip -r openjazz-rg35xx-garlic.zip .
