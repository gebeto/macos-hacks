import lief

print("Parsing...")
target = lief.parse("/Users/gebeto/Desktop/Github/thingstrial/target")
print("Parsed...")
target.add_library("/Users/gebeto/Desktop/Github/thingstrial/libthingstrial.dylib")
print("Library added...")
target.write("/Users/gebeto/Desktop/Github/thingstrial/target.new")
print("DONE!")