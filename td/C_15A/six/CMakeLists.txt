cmake_minimum_required(VERSION 2.6)
project(six)

file(
	GLOB_RECURSE
	source_files
	../src/*
	)

add_executable(
	../bin/six
	${source_files}
	)
set(CMAKE_CXX_FLAGS "-g -Wall -pedantic -Wextra")
