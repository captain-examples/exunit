# Getting Captain working with ExUnit

## 1. 🧪 Ensure ExUnit produces JUnit output

`ExUnit` doesn't natively support writing output to a file, but you can use a [reporter](https://github.com/victorolinasc/junit-formatter) to produce JUnit output.

1. Add `:junit_formatter` to your deps
2. `mix deps.get`
3. Add `ExUnit.configure formatters: [JUnitFormatter, ExUnit.CLIFormatter]` in `test/test_helper.exs`
4. Configure the reporter as we have [in this repo](https://github.com/captain-examples/exunit/blob/main/config/test.exs#L29-L36)

With these changes, `ExUnit` will produce Captain-compatible XML output in the `tmp/junit` directory.

## 2. 🔐 Create an Access Token

Create an Access Token for your organization within [Captain][captain] ([more documentation here][create-access-token]).

Add the new token as an action secret to your repository. Conventionally, we call this secret `RWX_ACCESS_TOKEN`.

## 3. 💌 Install the Captain CLI and call it when running tests

See the [full documentation on test suite integration][test-suite-integration]. Use a glob when specifying `--test-results` since the JUnit reporter will write files named dynamically with our configuration. You'll also need to specify `--language Elixir` and `--framework ExUnit` to inform the Captain CLI about how to interpret the test result files.

```yaml
- uses: rwx-research/setup-captain@v1
- name: Run tests
  run: |
    captain run \
      --suite-id captain-examples-exunit \
      --test-results "tmp/junit/*.xml" \
      --language Elixir \
      --framework ExUnit \
      -- mix test
  env:
    RWX_ACCESS_TOKEN: ${{ secrets.RWX_ACCESS_TOKEN }}
```

## 4. 🎉 See your test results in Captain!

Take a look at the [final workflow!][workflow-with-captain]

[captain]: https://account.rwx.com/deep_link/manage/access_tokens
[create-access-token]: https://www.rwx.com/docs/access-tokens
[workflow-with-captain]: https://github.com/captain-examples/exunit/blob/main/.github/workflows/ci.yml
[test-suite-integration]: https://www.rwx.com/captain/docs/test-suite-integration
