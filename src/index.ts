import * as core from '@actions/core';

try {
  const id: string = core.getInput('id');
  core.setOutput('data', id);
} catch (err: unknown) {
  if (err instanceof Error) {
    core.setFailed(err.message);
  } else {
    core.setFailed(String(err));
  }
}
