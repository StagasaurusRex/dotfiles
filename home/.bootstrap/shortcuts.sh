#!/usr/bin/env bash


# Character         Special Key              Abbreviation
#--------------------------------------------------------
# @                 Command (Apple)            CMD
# ~                 Option                     OPT
# $                 Shift                      SHIFT
# ^                 Control                    CTRL
defaults write -app Safari NSUserKeyEquivalents -dict-add "Move Tab to New Window" -string "^~="
defaults write -app Safari NSUserKeyEquivalents -dict-add "Move Tab to New Private Window" -string "^~="
