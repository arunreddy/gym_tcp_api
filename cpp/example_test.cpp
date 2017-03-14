/**
 * @file example.cpp
 * @author Marcus Edel
 *
 * Simple random agent.
 */

#include <iostream>

#include "environment.hpp"

#include <mlpack/core.hpp>

using namespace gym;
using namespace mlpack;

int main(int argc, char* argv[])
{
  const std::string environment = "CartPole-v0";
  const std::string host = "127.0.0.1";
  const std::string port = "4040";

  Log::Debug << "Compiled with debugging symbols." << std::endl;

  Log::Info << "Some test informational output." << std::endl;

  double totalReward = 0;
  size_t totalSteps = 0;

  Environment env(host, port, environment);
  env.compression(9);
  env.monitor.start("./dummy/", true, true);

  env.reset();
  env.render();

  while (1)
  {
    arma::mat action = env.action_space.sample();
    std::cout << "action: \n" << action << std::endl;

    env.step(action);

    totalReward += env.reward;
    totalSteps += 1;

    if (env.done)
    {
      break;
    }

    std::cout << "Current step: " << totalSteps << " current reward: "
      << totalReward << std::endl;
  }

  std::cout << "Instance: " << env.instance << " total steps: " << totalSteps
      << " reward: " << totalReward << std::endl;

  return 0;
}
