package kr.or.ddit.stt.cobi;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.sound.sampled.AudioFileFormat;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.TargetDataLine;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.config.Task;

import kr.or.ddit.vo.MemberVO;


public class MicFileCall {

	public void recordAudio() {
	    System.out.println("recordAudio");
	      
	    JavaSoundRecorder javaSoundRecorder = new JavaSoundRecorder();
		Thread thread = new Thread((Runnable) javaSoundRecorder);
		
		//멈춤
		thread.start();
		
		//녹음
		javaSoundRecorder.finish();
	}
	
	@Async
	public class JavaSoundRecorder{

		static final long RECORD_TIME = 60000;  // 1 minute
		
		HttpSession session;
//		MemberVO member = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
//		String mem_id = member.getMem_id();
		
	    // path of the wav file
//	    File wavFile = new File("./RecordAudio.wav");
	    File wavFile = new File("D:/user_voice/"+ "rewr" +".wav");

	    // format of audio file
	    AudioFileFormat.Type fileType = AudioFileFormat.Type.WAVE;

	    // the line from which audio data is captured
	    private TargetDataLine line;

		public void call() throws Exception {
			try {
				AudioFormat format = getAudioFormat();
				DataLine.Info info = new DataLine.Info(TargetDataLine.class, format);

				// checks if system supports the data line
				if (!AudioSystem.isLineSupported(info)) {
					System.out.println("Line not supported");
					System.exit(0);
				}
				line = (TargetDataLine) AudioSystem.getLine(info);
				line.open(format);
				line.start(); // start capturing

				System.out.println("Start capturing...");

				AudioInputStream ais = new AudioInputStream(line);

				System.out.println("Start recording...");

				// start recording
				AudioSystem.write(ais, fileType, wavFile);

			} catch (LineUnavailableException | IOException ex) {
				ex.printStackTrace();
			}

		}

		AudioFormat getAudioFormat() {
			float sampleRate = 16000;
			int sampleSizeInBits = 8;
			int channels = 2;
			boolean signed = true;
			boolean bigEndian = true;
			AudioFormat format = new AudioFormat(sampleRate, sampleSizeInBits,
					channels, signed, bigEndian);
			return format;
		}

		public void finish() {
			line.stop();
			line.close();
			System.out.println("Finished");
		}
		
	} //JavaSoundRecorder class 끝
}
