cmake_minimum_required(VERSION 2.6)
project(mini-projet_un)

file(
	GLOB_RECURSE
	source_files
	../src/*
	)

add_executable(
	../bin/mini-projet_un
	${source_files}
	)
set(CMAKE_CXX_FLAGS "-g -Wall -pedantic -Wextra")
