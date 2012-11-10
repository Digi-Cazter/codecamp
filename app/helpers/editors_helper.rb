module EditorsHelper
	def run_command(url)
    request = Curl.get(url)
		code    = JSON.parse(request.body_str)["data"]["text"]
    lines   = code.split("\n")
    output  = capture_stdout { Sandrbox.perform(lines).output }
    output.string + "<br /> => " + Sandrbox.perform(lines).output.to_s
	end
end
