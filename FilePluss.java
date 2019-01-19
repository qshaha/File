import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class FilePluss {
	public void changeFile(String inputPath, String outputPath) {
		File file = new File(inputPath);
		File file2 = new File(outputPath);
		try(BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(file2, true))) {
			int temp = -1;
			double len = file.length();
			long i = 0;
			int p = 1;
			while((temp = bufferedInputStream.read()) != -1) {
				bufferedOutputStream.write(-temp);
				i += 1;
				if((int)(i / len * 100) == p) {
					System.out.println(p + "%");
					p += 1;
				}
			}
			System.out.println("完成！");
		} 
		catch (FileNotFoundException e) {
			e.printStackTrace();
		} 
		catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	public String[] receivingPath() {
		try(BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in))) {
			String[] paths = new String[2];
			System.out.println("文件路径：");
			paths[0] = bufferedReader.readLine();
			System.out.println("输出路径：");
			paths[1] = bufferedReader.readLine();
			return(paths);
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
		FilePluss filePluss = new FilePluss();
		String paths[] = filePluss.receivingPath();
		filePluss.changeFile(paths[0], paths[1]);
	}
}
