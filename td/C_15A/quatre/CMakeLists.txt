cmake_minimum_required(VERSION 2.6)
project(quatre)

file(
	GLOB_RECURSE
	source_files
	../src/*
	)

add_executable(
	../bin/quatre
	${source_files}
	)
