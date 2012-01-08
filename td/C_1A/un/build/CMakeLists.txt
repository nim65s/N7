cmake_minimum_required(VERSION 2.6)
project(un)

file(
	GLOB_RECURSE
	source_files
	../src/*
	)

add_executable(
	../bin/un
	${source_files}
	)
