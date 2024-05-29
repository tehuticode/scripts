#!/bin/bash

# Create necessary directories
mkdir -p src/models

# Move files to appropriate directories
mv index.js src/
mv models/Todo.js src/models/

# Move any additional files in models directory to src/models if necessary
if [ "$(ls -A models)" ]; then
    mv models/* src/models/
fi

# Clean up empty directories
rmdir models 2>/dev/null

echo "Files and directories organized successfully."

