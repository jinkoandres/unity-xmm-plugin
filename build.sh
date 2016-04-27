# arguments + options parsing

# while [[ $# > 1 ]]
# do
# key="$1"

# case $key in
#     -p|--platform)
#     PLATFORM="$2"
#     shift # past argument
#     ;;
#     -c|--clean)
#     SEARCHPATH="$2"
#     shift # past argument
#     ;;
#     -l|--lib)
#     LIBPATH="$2"
#     shift # past argument
#     ;;
#     --default)
#     DEFAULT=YES
#     ;;
#     *)
#             # unknown option
#     ;;
# esac
# shift # past argument or value
# done

platform=$1

if [ $platform == "android" ]
then
cd ./platform/android/jni

ndk-build clean && ndk-build

cd ../libs

for i in $(ls -d */); do
	ff=$(echo ${i%%/});
	mkdir -p ../../../../Assets/Plugins/Android-"$ff"
	cp -r "$ff"/* ../../../../Assets/Plugins/Android-"$ff"
done

elif [ $platform == "apple" ]
then
#xcodebuild something
rm -rf ./platform/apple/bin/XMMEngine.bundle
xcodebuild -project ./platform/apple/xmm-macos.xcodeproj
mkdir -p ../Assets/Plugins/apple
cp -r ./platform/apple/bin/XMMEngine.bundle ../Assets/Plugins/apple
rm -rf ./platform/apple/build

fi