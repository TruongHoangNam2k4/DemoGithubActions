package com.example.TruongCongHoan;

import java.util.UUID;
import org.springframework.stereotype.Component;

/**
 * Duy trì một mã "lần chạy" (runId) trong suốt vòng đời process server.
 * Frontend dùng runId để biết khi nào phải reset dữ liệu draft.
 */
@Component
public class ServerRunId {
	private final String runId = UUID.randomUUID().toString();

	public String getRunId() {
		return runId;
	}
}

