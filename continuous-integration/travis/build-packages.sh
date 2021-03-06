set -e
if [[ $DISABLE_TRAVIS != 0 ]]; then
  if [[ $TRAVIS_OS_NAME == linux ]]; then
      if [[ $BUILD_ARGH == 0 ]]; then
        conda build conda-recipes/argh --quiet
        export BUILD_ARGH=$?
        export PACK="$(conda build conda-recipes/argh --output)"
        conda convert $PACK -p 'all' --quiet -o $CONDA_BLD_PATH
        conda index $CONDA_BLD_PATH/$TRAVIS_OS_NAME-64
      fi

      if [[ $BUILD_PATHTOOLS == 0 ]]; then
        conda build conda-recipes/pathtools --quiet
        export BUILD_PATHTOOLS=$?
        export PACK="$(conda build conda-recipes/pathtools --output)"
        conda convert $PACK -p 'all' --quiet -o $CONDA_BLD_PATH
        conda index $CONDA_BLD_PATH/$TRAVIS_OS_NAME-64
      fi

      if [[ $BUILD_ENAML_PYGMENTS == 0 ]]; then
        conda build conda-recipes/enaml-pygments --quiet
        export BUILD_ENAML_PYGMENTS=$?
        export PACK="$(conda build conda-recipes/enaml-pygments --output)"
        conda convert $PACK -p 'all' --quiet -o $CONDA_BLD_PATH
        conda index $CONDA_BLD_PATH/$TRAVIS_OS_NAME-64
      fi

      if [[ $BUILD_PYCLIBRARY == 0 ]]; then
        conda build conda-recipes/pyclibrary --quiet
        export BUILD_PYCLIBRARY=$?
        export PACK="$(conda build conda-recipes/pyclibrary --output)"
        conda convert $PACK -p 'all' --quiet -o $CONDA_BLD_PATH
        conda index $CONDA_BLD_PATH/$TRAVIS_OS_NAME-64
      fi

      if [[ $BUILD_PYVISA == 0 ]]; then
        conda build conda-recipes/pyvisa --quiet
        export BUILD_PYVISA=$?
        export PACK="$(conda build conda-recipes/pyvisa --output)"
        conda convert $PACK -p 'all' --quiet -o $CONDA_BLD_PATH
      fi
  fi

  if [[ $BUILD_WATCHDOG == 0 ]]; then
    conda build conda-recipes/watchdog --quiet -c file://$CONDA_BLD_PATH
    export BUILD_WATCHDOG=$?
    if [[ $TRAVIS_OS_NAME == "linux" ]]; then
      export PACK="$(conda build conda-recipes/watchdog --output)"
      conda convert $PACK -p 'win-32' --quiet -o $CONDA_BLD_PATH
      conda convert $PACK -p 'win-64' --quiet -o $CONDA_BLD_PATH
    fi
  fi

  if [[ $BUILD_ATOM == 0 ]]; then
    conda build conda-recipes/atom --quiet
    export BUILD_ATOM=$?
    conda index $CONDA_BLD_PATH/$TRAVIS_OS_NAME-64
  fi

  if [[ $BUILD_KIWISOLVER == 0 ]]; then
    conda build conda-recipes/kiwisolver --quiet
    export BUILD_KIWISOLVER=$?
    conda index $CONDA_BLD_PATH/$TRAVIS_OS_NAME-64
  fi
  if [[ $BUILD_ENAML == 0 ]]; then
    conda build conda-recipes/enaml --quiet  -c file://$CONDA_BLD_PATH
    export BUILD_ENAML=$?
  fi
fi
